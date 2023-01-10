STACK_VERSION=7.15.0
RELEASE=helm-es-security
ELASTICSEARCH_IMAGE=docker.elastic.co/elasticsearch/elasticsearch:${STACK_VERSION}
TIMEOUT=1200s


docker rm -f elastic-helm-charts-certs || true
	rm -f elastic-certificates.p12 elastic-certificate.pem elastic-certificate.crt elastic-stack-ca.p12 || true
	docker run --name elastic-helm-charts-certs -i -w /tmp \
		$ELASTICSEARCH_IMAGE \
		/bin/sh -c " \
			elasticsearch-certutil ca --out /tmp/elastic-stack-ca.p12 --pass '' && \
			elasticsearch-certutil cert --name security-master --dns security-master --ca /tmp/elastic-stack-ca.p12 --pass '' --ca-pass '' --out /tmp/elastic-certificates.p12" && \
	docker cp elastic-helm-charts-certs:/tmp/elastic-certificates.p12 ./ && \
	docker rm -f elastic-helm-charts-certs && \
	openssl pkcs12 -nodes -passin pass:'' -in elastic-certificates.p12 -out elastic-certificate.pem && \
	openssl x509 -outform der -in elastic-certificate.pem -out elastic-certificate.crt && \
    kubectl create secret generic elastic-certificates --from-file=elastic-certificates.p12 --dry-run=client -o yaml > elastic-certificates.yaml && \
	kubectl create secret generic elastic-certificate-pem --from-file=elastic-certificate.pem --dry-run=client -o yaml > elastic-certificate-pem.yaml && \
	kubectl create secret generic elastic-certificate-crt --from-file=elastic-certificate.crt --dry-run=client -o yaml > elastic-certificate-crt.yaml #&& \
	#rm -f elastic-certificates.p12 elastic-certificate.pem elastic-certificate.crt elastic-stack-ca.p12
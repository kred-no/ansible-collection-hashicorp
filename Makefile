export API_KEY				      ?= secret-key-here

export COLLECTION_NAMESPACE := `grep 'namespace:' galaxy.yml|awk '{print $$2}'`
export COLLECTION_NAME      := `grep 'name:' galaxy.yml|awk '{print $$2}'`
export COLLECTION_VERSION   := `grep 'version:' galaxy.yml|awk '{print $$2}'`

.PHONY: build
build:
	@ansible-galaxy collection build .

.PHONY: publish
publish:
	@ansible-galaxy collection publish ${COLLECTION_NAMESPACE}-${COLLECTION_NAME}-${COLLECTION_VERSION}.tar.gz --token=${API_KEY}

.PHONY: version
version:
	@echo "Namespace: ${COLLECTION_NAMESPACE}"
	@echo "Name: ${COLLECTION_NAME}"
	@echo "Version: ${COLLECTION_VERSION}"
	@echo "Collection: ${COLLECTION_NAMESPACE}-${COLLECTION_NAME}-${COLLECTION_VERSION}"

.PHONY: clean
clean:
	@rm -f *.tar.gz
	@molecule destroy --all

all: ready pyaws

ready: config/aws.yml
	@git submodule update --init --recursive
	@bundle check 2>&1 >/dev/null || { bundle --local --path vendor/bundle > /dev/null && bundle check; }
	@bundle exec microwave -j config/microwave.json

pyaws: .awscli/bin/aws
	
.awscli/bin/aws: .awscli/bin/python
	@set +u; source .awscli/bin/activate; pip install --index-url=file://`pwd`/vendor/cache/pip/simple awscli

.awscli/bin/python:
	@python libexec/virtualenv.py --extra-search-dir=vendor --never-download .awscli

config/aws.yml:
	@echo "missing config/aws.yml, here's an example"
	@cat config/aws.yml.example
	@false

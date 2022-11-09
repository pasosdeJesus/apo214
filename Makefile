
valida: valida-js valida-ruby

valida-js:
	for i in `find app/assets/javascripts/ -name "*coffee"`; do \
	coffee -o /tmp/ $$i; \
	done
	find app -name "*js" -exec node -c {} ';'

valida-ruby:
	find . -name "*\.rb" -exec ruby -w -W2 -c {} ';'
	bin/bundler-audit
	bin/brakeman

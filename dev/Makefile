.PHONY: all clean html sums
all: clean sums 

clean: 
	vagrant destroy --force

html: 
	vagrant up && \
	vagrant ssh --command '/ohana/dev/generate_html.sh'

sums: 
	vagrant up && \
	vagrant ssh --command '/ohana/dev/calculate_sums.sh'

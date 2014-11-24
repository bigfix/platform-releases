all: clean sums 

clean: 
	vagrant destroy --force

sums: 
	vagrant up && \
	vagrant ssh --command '/ohana/dev/calculate_sums.sh'

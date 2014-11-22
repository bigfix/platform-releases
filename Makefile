all: clean sums 

clean: 
	vagrant destroy --force

sums: 
	vagrant up && \
	vagrant ssh --command '/vagrant/dev/calculate_sums.sh'

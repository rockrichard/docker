

export PROJECT_NAME=SolidForward_Builder
export PROJECT_VERSION=1.0.0
export PROJECT_GROUP=com.solidforward.dev


ifndef VM_HOST
    VM_HOST=192.168.250
endif


check_defined = \
    $(foreach 1,$1,$(__check_defined))
__check_defined = \
    $(if $(value $1),, \
      $(error Undefined $1$(if $(value 2), ($(strip $2)))))

#######################################
.PHONY: test

all: test


dockerRunNexus: 
	echo "----- dockerRunNexus -----"
	# sudo mkdir -f ~/disks/data/nexus
	# sudo chown -R 200 ~/disks/data/nexus
	docker run \
	      -td -p 8082:8081 --name nexus \
	      -v ~/disks/data/nexus:/nexus-data \
	      -e NEXUS_CONTEXT=/ \
	      sonatype/docker-nexus3

	# Ref: https://github.com/sonatype/docker-nexus3  
	# Login: admin/admin123 	

# All in one setup
dockerRunDrupal01:
	echo "----- dockerRunDrupalDev 1 -----"
	docker run \
		-td -p 8081:80 \
		-e "DRUPAL_VERSION=drupal-7" \
		-e "DRUPAL_SITE_NAME=PD2" \
		boran/drupal
# Ref: https://github.com/Boran/docker-drupal

dockerRunDrupal02:
	echo "----- dockerRunDrupal 02 -----"
	docker run \
		-td -p 8090:80 \
		-e "DRUPAL_VERSION=drupal-7" \
		-e "DRUPAL_SITE_NAME=PD3" \
		-v ~/git/solidforward/platform/html:/var/www/html \
		--name drupal_pd3 \
		boran/drupal

dockerRunDrupalDev10:
	docker run \
		-td -p 8083:80 \
		-p 8022:22 \
		-v /home/richard/git/rh/parceldelivery/html/sites/all/modules:/var/www/sites/all/modules/custom \
		-e "DRUPAL_VERSION=drupal-7" \
		-e "DRUPAL_SITE_NAME=PD2" \
		wadmiraal/drupal:7
	
# -e BLACKFIREIO_SERVER_TOKEN="c756ac4993d7ab5e2e0388335e32a94405687f10a5333f7d4f3c56fb4d0f6333" \
# -e BLACKFIREIO_SERVER_ID="898a1593-19f1-4afd-8f38-1ff8a3edef77" \	
# --rm -e BLACKFIREIO_SERVER_ID="[898a1593-19f1-4afd-8f38-1ff8a3edef77]" -e BLACKFIREIO_SERVER_TOKEN="[c756ac4993d7ab5e2e0388335e32a94405687f10a5333f7d4f3c56fb4d0f6333]"	
# Ref: https://github.com/wadmiraal/docker-drupal
clean:


print:

test:
	echo "----- Test -----"


#!/bin/bash

set -ex


#methods to populate the templates
function populate_environment()
{
	declare env_template=`cat $CHARM_DIR/contrib/errbit/dot-env.tpl | 
		sed	-e 's/{{ port }}/'${errbit_port}/ \

	echo $env_template > /home/errbit/errbit/.env
  chown errbit:errbit /home/errbit/errbit/.env
}


function populate_config()
{
	declare config_template=`cat $CHARM_DIR/contrib/errbit/config.tpl | 
		sed -e 's/{{ errbit_host }}/'${errbit_host}/ \
				-e 's/{{ smtp_user }}/'${errbit_smtp_user}/ \
				-e 's/{{ per_app_notice }}/'${errbit_per_app_notice}/ \
        -e 's/{{ confirm_resolve }}/'${errbit_confirm_resolve}/ \
        -e 's/{{ gravatar }}/'${errbit_gravatar}/ \
        -e 's/{{ smtp_host }}/'${errbit_smtp_host}/ \
        -e 's/{{ smtp_domain }}/'${errbit_smtp_domain}/ \
        -e 's/{{ smtp_port }}/'${errbit_smtp_port}/ \
        -e 's/{{ smtp_user }}/'${errbit_smtp_user}/ \
        -e 's/{{ smtp_pass }}/'${errbit_smtp_pass}/ \
        -e 's/{{ smtp_starttls_auto }}/'${errbit_starttls_auto}/
   
  echo $config_template > /home/errbit/errbit/config/config.yml
  chown errbit:errbit /home/errbit/errbit/config/config.yml 
}


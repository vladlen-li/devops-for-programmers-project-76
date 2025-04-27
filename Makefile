include .env
export $(shell sed 's/=.*//' .env)

check_env:
	./checks.sh
ansible-dependencies:
	ansible-galaxy install -r requirements.yml

ansible-deploy:
	ansible-playbook -i inventory.ini playbook.yml --vault-password-file get_vault_key

ansible-deploy-db:
	ansible-playbook -i inventory.ini playbook-db.yml --vault-password-file get_vault_key

ansible-destroy:
	ansible-playbook -i inventory.ini playbook-destroy.yml --vault-password-file get_vault_key

ansible-edit-all-secrets:
	ansible-vault edit group_vars/all/vault.yml --vault-password-file get_vault_key

ansible-edit-webservers-secrets:
	ansible-vault edit group_vars/webservers/vault.yml --vault-password-file get_vault_key

start: check_env ansible-dependencies ansible-deploy

start-db: check_env ansible-dependencies ansible-deploy-db

destroy: check_env ansible-destroy

edit_all_secrets: check_env ansible-edit-all-secrets

edit_ws_secrets: check_env ansible-edit-webservers-secrets

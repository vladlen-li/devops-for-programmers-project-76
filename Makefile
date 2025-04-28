include .env
export $(shell sed 's/=.*//' .env)

ansible-dependencies:
	ansible-galaxy install -r requirements.yml

ansible-deploy:
	ansible-playbook -i inventory.ini playbook.yml --vault-password-file get_vault_key  --skip-tags destroy

ansible-destroy:
	ansible-playbook -i inventory.ini playbook.yml --vault-password-file get_vault_key --tags destroy

ansible-edit-secrets:
	ansible-vault edit group_vars/webservers/vault.yml --vault-password-file get_vault_key

start: ansible-dependencies ansible-deploy

destroy: ansible-destroy

edit-secrets: ansible-edit-secrets

.PHONY: iso

iso:
	vagrant up --no-provision
	vagrant provision

push:
	rsync -avh --progress *.iso oar-docmaster.website:~/kameleon-doc/iso/

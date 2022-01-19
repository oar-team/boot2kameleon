.PHONY: iso

iso:
	vagrant up --no-provision
	vagrant provision
	vagrant destroy -f

push:
	rsync -avh --progress *.iso oar-docmaster.website:~/kameleon-doc/iso/

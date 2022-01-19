#debootstrap

SUITE=bullseye
MIRROR=http://ftp.debian.org/debian
PACKAGES="apt-utils ca-certificates isc-dhcp-client isc-dhcp-common ifupdown
          iproute2 openssh-server xz-utils systemd systemd-sysv acpid
          acpi-support-base parted e2fsprogs debootstrap extlinux vim nano"

PACKAGES="linux-image-amd64 $PACKAGES"
ARCH="amd64"

echo "---> debootstrapping"

if [ ! -f "$1/.kameleon_timestamp" ]; then
    sudo debootstrap --include="$PACKAGES" --arch $ARCH --variant=minbase $SUITE $1 $MIRROR && \
    sudo date +%s > $1/.kameleon_timestamp
else
    echo "!!! A build was already run in the VM, not running debootstrap !!!"
    echo "!!! Make sure the VM is destroyed after the build !!!"
fi

cat /etc/resolv.conf > $1/etc/resolv.conf

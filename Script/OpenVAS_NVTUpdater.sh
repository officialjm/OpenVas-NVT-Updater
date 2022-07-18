!/bin/bash
export FEED=feed.community.greenbone.net
export COMMUNITY_NVT_RSYNC_FEED=rsync://$FEED:/nvt-feed
export COMMUNITY_CERT_RSYNC_FEED=rsync://$FEED:/cert-data
export COMMUNITY_SCAP_RSYNC_FEED=rsync://$FEED:/scap-data

/usr/sbin/greenbone-nvt-sync
/usr/sbin/openvasmd --rebuild --progress
/usr/sbin/greenbone-certdata-sync
/usr/sbin/greenbone-scapdata-sync
/usr/sbin/openvasmd --update --verbose --progress
/etc/init.d/openvas-manager restart
/etc/init.d/openvas-scanner restart

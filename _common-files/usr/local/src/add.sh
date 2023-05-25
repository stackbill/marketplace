#! /bin/bash

# Before running this script, make sure to replace the /path/to your OpenSearch directory,
# and remember to replace the CN in the node's distinguished name with a real
# DNS A record.

echo "plugins.security.ssl.transport.pemcert_filepath: /opt/opensearch/config/certs/node1.pem" | sudo tee -a /opt/opensearch/config/opensearch.yml
echo "plugins.security.ssl.transport.pemkey_filepath: /opt/opensearch/config/certs/node1-key.pem" | sudo tee -a /opt/opensearch/config/opensearch.yml
echo "plugins.security.ssl.transport.pemtrustedcas_filepath: /opt/opensearch/config/certs/root-ca.pem" | sudo tee -a /opt/opensearch/config/opensearch.yml
echo "plugins.security.ssl.http.enabled: true" | sudo tee -a /opt/opensearch/config/opensearch.yml
echo "plugins.security.ssl.http.pemcert_filepath: /opt/opensearch/config/certs/node1.pem" | sudo tee -a /opt/opensearch/config/opensearch.yml
echo "plugins.security.ssl.http.pemkey_filepath: /opt/opensearch/config/certs/node1-key.pem" | sudo tee -a /opt/opensearch/config/opensearch.yml
echo "plugins.security.ssl.http.pemtrustedcas_filepath: /opt/opensearch/config/certs/root-ca.pem" | sudo tee -a /opt/opensearch/config/opensearch.yml
echo "plugins.security.allow_default_init_securityindex: true" | sudo tee -a /opt/opensearch/config/opensearch.yml
echo "plugins.security.authcz.admin_dn:" | sudo tee -a /opt/opensearch/config/opensearch.yml
echo "  - 'CN=A,OU=UNIT,O=ORG,L=TORONTO,ST=ONTARIO,C=CA'" | sudo tee -a /opt/opensearch/config/opensearch.yml
echo "plugins.security.nodes_dn:" | sudo tee -a /opt/opensearch/config/opensearch.yml
echo "  - 'CN=node1.dns.a-record,OU=UNIT,O=ORG,L=TORONTO,ST=ONTARIO,C=CA'" | sudo tee -a /opt/opensearch/config/opensearch.yml
echo "plugins.security.audit.type: internal_opensearch" | sudo tee -a /opt/opensearch/config/opensearch.yml
echo "plugins.security.enable_snapshot_restore_privilege: true" | sudo tee -a /opt/opensearch/config/opensearch.yml
echo "plugins.security.check_snapshot_restore_write_privileges: true" | sudo tee -a /opt/opensearch/config/opensearch.yml
echo "plugins.security.restapi.roles_enabled: [\"all_access\", \"security_rest_api_access\"]" | sudo tee -a /opt/opensearch/config/opensearch.yml
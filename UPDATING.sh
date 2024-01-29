#!/bin/sh

# Copy all roles.
for role in ../ansible-role-bareos_* ; do
  short=$(echo ${role} | cut -d\- -f3)
  if [ ! -d roles/${short} ] ; then
    mkdir "roles/${short}"
    echo "Copying ${role} to roles/${short}."
    for object in LICENSE README.md defaults files handlers meta requirements.yml tasks templates vars ; do
      if [ -d "${role}/${object}" ] ; then
        cp -Rip "${role}/${object}" "roles/${short}/${object}"
      elif [ -f "${role}/${object}" ] ; then
        cp "${role}/${object}" "roles/${short}/${object}"
      fi
    done
  fi
done

# Use proper role FQCNs in README example playbooks
sed -i 's|- role: adfinis\.|- role: adfinis.roles.|' roles/*/README.md

# Use proper role FQCNs in role `dependencies:`
sed -i 's|- adfinis\.|- adfinis.roles.|' roles/*/meta/main.yml

# Regenerate all used collections.
echo -e "---\n" > requirements.yml
echo "collections:" >> requirements.yml
cat roles/*/requirements.yml | grep '  - name: ' | grep -v adfinis | sort | uniq >> requirements.yml

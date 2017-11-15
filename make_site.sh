#!/bin/bash


echo "Changing directory to /home/islandora/site"
cd /home/islandora/site || exit

echo "Using Drush makefile to create sample Drupal site within /home/islandora/site/drupal_install"
/usr/local/bin/drush make --prepare-install /home/islandora/site/drupal.drush.make /home/islandora/site/drupal_install

echo "Using Islandora makefile for Islandora Modules for sample Drupal site within /home/islandora/site/drupal_install"
/usr/local/bin/drush make --no-core /home/islandora/site/islandora.drush.make /home/islandora/site/drupal_install

echo "Copy /home/islandora/site/drupal_install contents to /var/www/html"
cp -rv /home/islandora/site/drupal_install/. /var/www/html/

echo "Copy settings.php file for sample Site to work"
cp -v /home/islandora/site/settings.php /var/www/html/sites/default/

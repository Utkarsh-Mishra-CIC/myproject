<?php
/**
 * @file
 * proj_mass_contact.features.inc
 */

/**
 * Implements hook_ctools_plugin_api().
 */
function proj_mass_contact_ctools_plugin_api() {
  list($module, $api) = func_get_args();
  if ($module == "strongarm" && $api == "strongarm") {
    return array("version" => "1");
  }
}

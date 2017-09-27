<?php

/* Usage: getRepositories("CCSF-Coders") */
function getRepositories($org) {
	$ch = curl_init("https://api.github.com/orgs/" . $org . "/repos");
	curl_setopt($ch, CURLOPT_HTTPHEADER, array(
		'Content-Type: application/json',
		'User-Agent: curl/' . curl_version()
	));
	$data = curl_exec($ch);
	curl_close($ch);
	return json_decode($data, true);
}

?>

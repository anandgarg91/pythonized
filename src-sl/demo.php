<html>
	<head>
		<title>Output</title>
	</head>
	<body>
		<h1>output</h1>
<pre>
<?php system("ls -alFh", $rc); ?>
</pre>
	<br>
	<?php echo "Return Code: {$rc}\n"; ?>
	</body>
</html>


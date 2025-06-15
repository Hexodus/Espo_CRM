<?php
// automations/index.php
// webhook endpoint to receive JSON data from BookStack and echo it back

// Set a JSON response header
header('Content-Type: application/json');

// Get the raw POST data
$input = file_get_contents('php://input');

// **Enhanced Logging with Script-Relative Path:**
$logFilePath = __DIR__ . '/webhook.log'; // Path relative to the script's directory
$logMessage = date('Y-m-d H:i:s') . " - WEBHOOK DATA RECEIVED:\n" . $input . "\n-------------------\n";
file_put_contents($logFilePath, $logMessage, FILE_APPEND);

// Decode the JSON (set second parameter to true for an associative array)
$data = json_decode($input, true);

// Check for JSON errors
if (json_last_error() !== JSON_ERROR_NONE) {
    // Return an error response if the input isn’t valid JSON
    echo json_encode([
        'status'  => 'error',
        'message' => 'Invalid JSON received',
        'raw'     => $input,
    ], JSON_PRETTY_PRINT);
} else {
    // Return the received data as confirmation
    echo json_encode([
        'status'   => 'success',
        'received' => $data,
    ], JSON_PRETTY_PRINT);
}
?>
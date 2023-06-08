<?php

use Magento\Framework\App\DeploymentConfig\Writer;
use Magento\Framework\{
    App\ObjectManager,
    App\Bootstrap,
    Config\File\ConfigFilePool
};

require_once '/var/www/html/app/bootstrap.php';
Bootstrap::create(BP, $_SERVER);
$objectManager = ObjectManager::getInstance();

$configWriter = $objectManager->create(Writer::class);
$configWriter->saveConfig([ConfigFilePool::APP_ENV => [
    'cron_consumers_runner' => [
        'cron_run' => true,
        'max_messages' => 10000,
        'consumers' => ['codegeneratorProcessor']
    ]
]]);

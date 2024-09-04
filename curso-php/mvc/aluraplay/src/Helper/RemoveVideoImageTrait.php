<?php

namespace Mvc\Aluraplay\Helper;

use Mvc\Aluraplay\Model\Repository\VideoRepository;
use function file_exists;
use function unlink;

trait RemoveVideoImageTrait
{
    private const string IMAGE_PATH = __DIR__ . "/../../public/img/uploads/";

    public function removeVideoImage(int $id, VideoRepository $videoRepository) : bool
    {
        $video = $videoRepository->findById($id)[0];

        $filePath = self::IMAGE_PATH . $video->getFilePath();

        $result = false;

        if (file_exists($filePath)) {
            unlink($filePath);

            $result = $videoRepository->updateImagePathToNull($id);
        }

        return $result;
    }
}
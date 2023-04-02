import * as gcp from "@pulumi/gcp";
import { Bucket } from "@pulumi/gcp/storage";
import * as pulumi from "@pulumi/pulumi";
import * as compressing from "compressing";

export const generateNotifierBucketObject = async (bucket: Bucket) => {
  const cwd = process.cwd();
  // specify a file outside the pulumi project
  const absPath = cwd.replace("pulumi", "notifier/main.py");
  const zipPath = absPath.replace(".py", ".zip");

  await compressing.zip.compressFile(absPath, zipPath);

  return new gcp.storage.BucketObject("notifier-archive", {
    bucket: bucket.name,
    source: new pulumi.asset.FileAsset(zipPath),
  });
};

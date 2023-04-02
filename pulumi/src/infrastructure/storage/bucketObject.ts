import * as gcp from "@pulumi/gcp";
import { Bucket } from "@pulumi/gcp/storage";
import * as pulumi from "@pulumi/pulumi";

export const generateNotifierBucketObject = (bucket: Bucket) => {
  const cwd = process.cwd();
  // specify a file outside the pulumi project
  const absPath = cwd.replace("pulumi", "notifier/main.py");
  return new gcp.storage.BucketObject("notifier-archive", {
    bucket: bucket.name,
    source: new pulumi.asset.FileAsset(absPath),
  });
};

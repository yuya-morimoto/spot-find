import * as gcp from "@pulumi/gcp";
import { constant } from "../../constant";
import { Topic } from "@pulumi/gcp/pubsub";
import { Bucket, BucketObject } from "@pulumi/gcp/storage";

export const generateCloudBuildSlackNotifierFunction = (
  topic: Topic,
  bucket: Bucket,
  bucketObject: BucketObject
) => {
  const cloudBuildSlackNotifierFunction = new gcp.cloudfunctions.Function(
    "cloud-build-notifier-function",
    {
      description: constant.description,
      runtime: "python311",
      availableMemoryMb: 128,
      sourceArchiveBucket: bucket.name,
      sourceArchiveObject: bucketObject.name,
      eventTrigger: {
        eventType: "google.pubsub.topic.publish",
        resource: topic.name,
      },
      entryPoint: "slack_notifier",
    }
  );
  // IAM entry for all users to invoke the function
  const cloudBuildSlackNotifierInvoker =
    new gcp.cloudfunctions.FunctionIamMember("cloud-build-notifier-invoker", {
      project: cloudBuildSlackNotifierFunction.project,
      region: cloudBuildSlackNotifierFunction.region,
      cloudFunction: cloudBuildSlackNotifierFunction.name,
      role: "roles/cloudfunctions.invoker",
      member: "allUsers",
    });
  return {
    cloudBuildSlackNotifierFunction,
    cloudBuildSlackNotifierInvoker,
  };
};

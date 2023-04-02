import * as infrastructure from "../infrastructure";

export const cloudBuildNotifierFlow = async () => {
  const topic = infrastructure.pubSub.generateCloudBuildPubSub();
  const bucket = infrastructure.storage.generatedCloudFunctionsBucket();

  const bucketObject =
    await infrastructure.storage.generateNotifierBucketObject(bucket);

  const cloudFunctions =
    infrastructure.cloudFunctions.generateCloudBuildSlackNotifierFunction(
      topic,
      bucket,
      bucketObject
    );

  return {
    topic,
    bucket,
    bucketObject,
    cloudFunctions,
  };
};

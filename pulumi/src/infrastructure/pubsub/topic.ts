import * as gcp from "@pulumi/gcp";

export const generateCloudBuildPubSub = () => {
  return new gcp.pubsub.Topic("cloud-builds", { name: "cloud-builds" });
};

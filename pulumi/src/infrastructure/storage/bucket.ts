import * as gcp from "@pulumi/gcp";

export const generatedCloudFunctionsBucket = () => {
  const cloudfunctionsBucket = new gcp.storage.Bucket("cloudfunctions", {
    location: "asia",
  });
  return cloudfunctionsBucket;
};

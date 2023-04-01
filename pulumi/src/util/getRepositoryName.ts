import * as pulumi from "@pulumi/pulumi";

export const getRepositoryName = () => {
  const env = pulumi.getStack();
  if (env === "prd") {
    return "main";
  } else if (env === "stg") {
    return "stg";
  } else {
    return "dev";
  }
};

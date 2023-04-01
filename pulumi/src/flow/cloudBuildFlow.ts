import * as infrastructure from "../infrastructure";

export const cloudBuildFlow = () => {
  const cloudBuildServiceAccount =
    infrastructure.iam.generateCloudBuildServiceAccount();
  const cloudBuildPullRequestTrigger =
    infrastructure.cloudBuild.trigger.generatePullRequestTrigger();
  return { cloudBuildServiceAccount, cloudBuildPullRequestTrigger };
};

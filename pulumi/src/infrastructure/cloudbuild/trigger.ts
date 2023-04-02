import * as gcp from "@pulumi/gcp";
import { Account } from "@pulumi/gcp/serviceaccount";
import { constant } from "../../constant";
import { getBranchName } from "../../util";

export const generatePullRequestTrigger = (serviceAccount: Account) => {
  return new gcp.cloudbuild.Trigger("pull-request-trigger", {
    filename: "ci/pull-request.yaml",
    description: constant.description,
    location: "global",
    github: {
      name: constant.repositoryName,
      owner: constant.gitUserName,
      pullRequest: {
        branch: `^${getBranchName()}$`,
      },
    },
    serviceAccount: serviceAccount.id,
    // includeBuildLogs: "INCLUDE_BUILD_LOGS_WITH_STATUS",
  });
};

export const generatePushTrigger = (serviceAccount: Account) => {
  return new gcp.cloudbuild.Trigger("push-trigger", {
    filename: "ci/push.yaml",
    description: constant.description,
    location: "global",
    github: {
      name: constant.repositoryName,
      owner: constant.gitUserName,
      push: {
        branch: `^${getBranchName()}$`,
      },
    },
    serviceAccount: serviceAccount.id,
    includeBuildLogs: "INCLUDE_BUILD_LOGS_WITH_STATUS",
  });
};

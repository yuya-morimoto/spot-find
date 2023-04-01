import * as gcp from "@pulumi/gcp";
import { constant } from "../../constant";
import { generateRandomStringName } from "../../util/generateRandomString";

export const generateNetwork = () => {
  return new gcp.compute.Network(generateRandomStringName("network"), {
    description: constant.description,
    autoCreateSubnetworks: false,
  });
};

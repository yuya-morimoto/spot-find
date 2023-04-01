import * as gcp from "@pulumi/gcp";
import { constant } from "../../constant";

export const generateNetwork = () => {
  return new gcp.compute.Network("network", {
    description: constant.description,
    autoCreateSubnetworks: false,
  });
};

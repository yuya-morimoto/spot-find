import * as random from "@pulumi/random";

export const generateRandomStringName = (key: string, length: number = 8) => {
  const generated = new random.RandomString(`${key}-random-string`, {
    length,
  });
  return `${generated}-${key}`;
};

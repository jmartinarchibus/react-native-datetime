import { NativeModules } from 'react-native';

type DatetimeType = {
  multiply(a: number, b: number): Promise<number>;
  utcToLocal(utcString: string, timeZoneName: string): Promise<string>;
  localOffset(timeZoneName: string): Promise<string>;
};

const { Datetime } = NativeModules;

export const utcToLocalDate = async (
  utcString: string,
  timeZoneName: string
) => {
  const isoDate = await Datetime.utcToLocal(utcString, timeZoneName);
  return new Date(isoDate);
};

export default Datetime as DatetimeType;

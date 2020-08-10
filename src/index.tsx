import { NativeModules } from 'react-native';

type DatetimeType = {
  multiply(a: number, b: number): Promise<number>;
};

const { Datetime } = NativeModules;

export default Datetime as DatetimeType;

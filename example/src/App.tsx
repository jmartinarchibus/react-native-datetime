import * as React from 'react';
import { StyleSheet, View, Text } from 'react-native';
import Datetime, { utcToLocalDate } from 'react-native-datetime';

export default function App() {
  const [utcResult, setUtcResult] = React.useState<Date | undefined>();

  React.useEffect(() => {
    const date = new Date().toISOString();
    console.log(date);
    // Datetime.utcToLocal(date, 'Australia/Melbourne').then(setUtcResult);

    utcToLocalDate(date, 'Australia/Melbourne').then(setUtcResult);

    Datetime.localOffset('America/New_York').then((result: string) => {
      console.log(result);
    });
  }, []);

  return (
    <View style={styles.container}>
      <Text>Date: {utcResult?.toString()}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});

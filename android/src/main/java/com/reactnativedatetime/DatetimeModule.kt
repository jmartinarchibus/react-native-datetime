package com.reactnativedatetime

import android.os.Build
import androidx.annotation.RequiresApi
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise
import java.text.DateFormat
import java.text.SimpleDateFormat
import java.time.*
import java.time.format.DateTimeFormatter
import java.util.*

class DatetimeModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

    override fun getName(): String {
        return "Datetime"
    }

    // Example method
    // See https://facebook.github.io/react-native/docs/native-modules-android
    @ReactMethod
    fun multiply(a: Int, b: Int, promise: Promise) {

      promise.resolve(a * b)

    }



    @ReactMethod
    fun utcToLocal(utcString: String, timeZoneName: String, promise: Promise) {
      // val z = ZoneId.of(timeZoneName)
      // print(z)D

      val tz = TimeZone.getTimeZone(timeZoneName)
      print(tz)

      // val tmp = "2020-08-12T10:52:22Z"
      // val odt = OffsetDateTime.parse(utcString )
      // val s = SimpleDateFormat( "yyyy-MM-dd'T'HH:mm:ssX" );

      val s = SimpleDateFormat( "yyyy-MM-dd'T'HH:mm:ss.SSSX" );
      s.timeZone = TimeZone.getTimeZone("UTC")
      val parsedDate = s.parse(utcString)

      val df1 = SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
      df1.timeZone = tz

      val f = df1.format(parsedDate)
      print(f)


      print(f.toString())


      promise.resolve(f)
    }


}

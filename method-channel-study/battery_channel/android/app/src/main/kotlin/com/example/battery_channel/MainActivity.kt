package com.example.battery_channel

import android.content.Context
import android.content.ContextWrapper
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private lateinit var  channel: MethodChannel

    override fun configureFlutterEngine( flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger,
           BATTERY_CHANNEL
        )
        
        channel.setMethodCallHandler { call, result ->

            if(call.method == "getBatteryLevel"){
                val arguments = call.arguments<Map<String,String>>()
                val name= arguments?.get("name") ?: "Without name"

                val batteryLevel = getBatteryLevel()
                result.success("$name says: $batteryLevel")
            }
        }


    }
    private fun getBatteryLevel(): Int{
        val batteryLevel: Int
        if(VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP){
            val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        }else{
            val intent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter())
            batteryLevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL,-1) * 100
        }
        return  batteryLevel
    }
    companion object {
        private const val BATTERY_CHANNEL = "com.example.battery_channel/battery"
    }
}

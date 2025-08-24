package com.example.pagonrgb
import android.graphics.Color
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

      
        val redEditText: EditText = findViewById(R.id.redEditText)
        val greenEditText: EditText = findViewById(R.id.greenEditText)
        val blueEditText: EditText = findViewById(R.id.blueEditText)
        val convertButton: Button = findViewById(R.id.convertButton)
        val colorView: View = findViewById(R.id.colorView)

        
        convertButton.setOnClickListener {
           
            val redHex = redEditText.text.toString()
            val greenHex = greenEditText.text.toString()
            val blueHex = blueEditText.text.toString()

           
            if (redHex.length != 2 || greenHex.length != 2 || blueHex.length != 2) {
                Toast.makeText(this, "Please enter a two-digit code for each color.", Toast.LENGTH_SHORT).show()
                return@setOnClickListener
            }

            try {
                
                val red = redHex.toInt(16)
                val green = greenHex.toInt(16)
                val blue = blueHex.toInt(16)

              
                val newColor = Color.rgb(red, green, blue)
                colorView.setBackgroundColor(newColor)

            } catch (e: NumberFormatException) {
                
                Toast.makeText(this, "Invalid characters. Use 0-9 or A-F.", Toast.LENGTH_SHORT).show()
            }
        }
    }
}

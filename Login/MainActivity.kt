package com.login
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)


        val usernameEditText: EditText = findViewById(R.id.username)
        val passwordEditText: EditText = findViewById(R.id.password)
        val loginButton: Button = findViewById(R.id.login_button)
        val loginConfirmationTextView: TextView = findViewById(R.id.login_code_confirmation)
        val loginCodeTextView: TextView = findViewById(R.id.login_code)


        loginButton.setOnClickListener {

            val username = usernameEditText.text.toString()
            val password = passwordEditText.text.toString()


            if (username.equals("pagon", ignoreCase = true) && password == "1234") {

                loginConfirmationTextView.text = getString(R.string.login_code_confirmation, username)
            } else {

                loginConfirmationTextView.text = getString(R.string.login_failed)
                loginCodeTextView.text = ""
            }
        }
    }
}

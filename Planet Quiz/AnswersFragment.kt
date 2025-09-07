package com.planets

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.TextView
import androidx.fragment.app.Fragment

class AnswersFragment : Fragment() {

    private lateinit var questionType: String
    private var questionTextRes: Int = 0
    private var selectedPlanet: String? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        arguments?.let {
            questionType = it.getString("question_type", "")
            questionTextRes = it.getInt("question_text")
        }
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_answers, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        val questionText: TextView = view.findViewById(R.id.tv_question)
        val resultText: TextView = view.findViewById(R.id.tv_result)
        val detailText: TextView = view.findViewById(R.id.tv_detail)
        val tryAgainBtn: Button = view.findViewById(R.id.btn_try_again)

        questionText.setText(questionTextRes)

       
        val planets = listOf(
            view.findViewById<Button>(R.id.btn_mercury),
            view.findViewById<Button>(R.id.btn_venus),
            view.findViewById<Button>(R.id.btn_earth),
            view.findViewById<Button>(R.id.btn_mars),
            view.findViewById<Button>(R.id.btn_jupiter),
            view.findViewById<Button>(R.id.btn_saturn),
            view.findViewById<Button>(R.id.btn_uranus),
            view.findViewById<Button>(R.id.btn_neptune)
        )

        val submitBtn: Button = view.findViewById(R.id.btn_submit)
        submitBtn.isEnabled = false

        planets.forEach { button ->
            button.setOnClickListener {
                
                planets.forEach { it.isSelected = false }
             
                button.isSelected = true
                selectedPlanet = button.text.toString()
                submitBtn.isEnabled = true
            }
        }

        submitBtn.setOnClickListener {
            val isCorrect = checkAnswer(selectedPlanet)
            resultText.text = if (isCorrect) getString(R.string.correct) else getString(R.string.incorrect)
            detailText.text = getAnswerDetail()
            detailText.visibility = View.VISIBLE
            resultText.visibility = View.VISIBLE
            tryAgainBtn.visibility = View.VISIBLE
            submitBtn.visibility = View.GONE

            
            planets.forEach { it.isEnabled = false }
        }

        tryAgainBtn.setOnClickListener {
            parentFragmentManager.popBackStack()
        }
    }

    private fun checkAnswer(selectedPlanet: String?): Boolean {
        return when (questionType) {
            "largest" -> selectedPlanet == getString(R.string.jupiter)
            "moons" -> selectedPlanet == getString(R.string.saturn)
            "spin" -> selectedPlanet == getString(R.string.mercury)
            else -> false
        }
    }

    private fun getAnswerDetail(): String {
        return when (questionType) {
            "largest" -> getString(R.string.answer_largest)
            "moons" -> getString(R.string.answer_moons)
            "spin" -> getString(R.string.answer_spin)
            else -> ""
        }
    }
}

package com.planets

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.TextView
import androidx.fragment.app.Fragment
import androidx.fragment.app.commit

class QuestionsFragment : Fragment() {

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_questions, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        val question1: Button = view.findViewById(R.id.btn_question1)
        val question2: Button = view.findViewById(R.id.btn_question2)
        val question3: Button = view.findViewById(R.id.btn_question3)

        question1.setOnClickListener {
            navigateToAnswers("largest", R.string.question_largest)
        }

        question2.setOnClickListener {
            navigateToAnswers("moons", R.string.question_moons)
        }

        question3.setOnClickListener {
            navigateToAnswers("spin", R.string.question_spin)
        }
    }

    private fun navigateToAnswers(questionType: String, questionTextRes: Int) {
        val answersFragment = AnswersFragment().apply {
            arguments = Bundle().apply {
                putString("question_type", questionType)
                putInt("question_text", questionTextRes)
            }
        }

        parentFragmentManager.commit {
            replace(R.id.fragment_container, answersFragment)
            addToBackStack(null)
        }
    }
}

using UnityEngine;
using System.Collections;

public class TestController : MonoBehaviour
{
    [SerializeField] GUIStyle _style;

    string _text = "Test";

	IEnumerator Start()
    {
        Cursor.visible = false;

        var m = GetComponent<Renderer>().material;

        while (true)
        {
            // Pattern

            _text = "";
            m.shaderKeywords = new string[] {"_MODE_PATTERN"};
            yield return new WaitForSeconds(3);

            // Grayscale

            m.shaderKeywords = new string[] {"_MODE_FILL"};

            for (var i = 0; i <= 5; i++)
            {
                m.SetColor("_Color", Color.white * (0.2f * i));
                _text = "Grayscale " + (i * 20) + "%";
                yield return new WaitForSeconds(3);
            }

            // Colors

            _text = "";

            for (var i = 1; i <7; i++)
            {
                m.SetColor("_Color", new Color(i / 4, (i / 2) & 1, i & 1));
                yield return new WaitForSeconds(3);
            }

            // Blink

            _text = "5 Hz";

            for (var i = 0; i < 10; i++)
            {
                m.SetColor("_Color", Color.black);
                yield return new WaitForSeconds(1.0f / 10);
                m.SetColor("_Color", Color.white);
                yield return new WaitForSeconds(1.0f / 10);
            }

            _text = "10 Hz";

            for (var i = 0; i < 20; i++)
            {
                m.SetColor("_Color", Color.black);
                yield return new WaitForSeconds(1.0f / 20);
                m.SetColor("_Color", Color.white);
                yield return new WaitForSeconds(1.0f / 20);
            }

            _text = "30 Hz";

            for (var i = 0; i < 60; i++)
            {
                m.SetColor("_Color", Color.black);
                yield return null;
                m.SetColor("_Color", Color.white);
                yield return null;
            }

            // Checker

            m.shaderKeywords = new string[] {"_MODE_CHECKER"};
            _text = "";

            m.SetFloat("_Scale", 0.01f);
            yield return new WaitForSeconds(3);

            m.SetFloat("_Scale", 0.1f);
            yield return new WaitForSeconds(3);

            m.SetFloat("_Scale", 1);
            yield return new WaitForSeconds(3);

            // Spectrum

            m.shaderKeywords = new string[] {"_MODE_SPECTRUM"};
            _text = "";
            yield return new WaitForSeconds(3);
        }
	}

    void OnGUI()
    {
        GUI.Label(new Rect(0, 0, Screen.width, Screen.height), _text, _style);
    }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Dice : MonoBehaviour
{
  public SpriteRenderer spriteRenderer;
  public Sprite[] faces;
  private int currentValue = 0;
  // Start is called before the first frame update
  void Start()
  {
  }

  // Update is called once per frame
  void Update()
  {
    Roll();
    spriteRenderer.sprite = faces[currentValue];
  }

  int getCurrentValue()
  {
    return currentValue + 1;
  }

  void Roll()
  {

    currentValue = Random.Range(0, 6);
  }
}

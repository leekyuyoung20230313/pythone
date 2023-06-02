# -*- coding: utf-8 -*-
"""recomend_movie.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/113zJkwgVWiv1JTOB2alMVB-poaRLQHFi
"""

import argparse
import json
import numpy as np
from compute_score import person_score
from collaborate_filtering import find_simular_user

def build_parser():
  parser = argparse.ArgumentParser()
  parser.add_argument('--user', dest='user', required=True, help='Input user')
  parser.add_argument('--jsonfile', dest='jsonfile', required=True, help='Input jsonfile')
  return parser

"""사용자를 위한 영화 추천함수"""

def get_recommendation(dataset, input_user):
  if input_user not in dataset:
    raise TypeError(f"Can't find {input_user} in the dataset")
  overall_scores={}
  similarity_scores={}
  # 유사성 검사
  for user in [i for i in dataset if input_user != i]:
    similarity_score = person_score(dataset,input_user,user)
    # 유사성 점수가 0보다 작으면 다른 사용자와 유사성 점수를 계산
    if similarity_score <=0:
      continue
    # 현재 사용자가 평가했지만 입력한 사용자가 평가하지 않은 영화 목록을 추출
    filtered_list = [ x for x in dataset[user] if x not in \
                     dataset[input_user] or dataset[input_user][x] == 0]
    # 필터링한 각 영화항목에 대해서 유사성 점수를 기반으로 가중치가 부여된 평점 즉 유사성 점수를 추척
    for item in filtered_list:
      overall_scores.update( {item:dataset[user][item]*similarity_score}  )
      similarity_scores.update({item:similarity_score})

  # 유사점수가 0이면 아무것도 추천하지 않음
  if len(overall_scores) == 0:
    return ['No Recomendations Possible']
  # 가중치 점수에 기반한 정규화
  movie_scores =  [ [score/similarity_scores[item], item] for item,score in  overall_scores.items()]
  movie_scores = np.array(movie_scores)
  # 점수를 정렬하고 추천
  movie_scores = movie_scores[np.argsort(movie_scores[:,0])[::-1]]
  # 영화 추천
  movie_recomendations = [movie  for _, movie in movie_scores]
  return movie_recomendations

if __name__ =='__main__':
  args = build_parser().parse_args()
  user = args.user
  jsonfile = args.jsonfile
  with open(jsonfile,'r') as f:
    data = json.loads(f.read())
  
  print(f'movie recommendations for {user} ')

  movies = get_recommendation(data,user)
  
  for i, movies in enumerate(movies):
    print(f'{i} : {movies}')
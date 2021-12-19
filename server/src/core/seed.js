const { db } = require('./db')

module.exports = {
  async seed() {
    await db.article.deleteMany({})
    await db.article.createMany({
      data: [
        {
          title: 'Why is recycling so important?',
          text: `Recycling is much more than just reducing the amount of waste sent to the landfill, with a long list of benefits that aren’t limited to the environment — there are economic and social advantages to recycling. Even as we live in a consumer-driven world, with a growing appetite for new things, if we begin to look at the waste created by this level of consumption in a different light, we might turn our problem into an opportunity. Whether it’s plastic, paper, or aluminum, the products and materials that can be used after they fulfill their original purpose are far from worthless. In fact, most materials have great recycling value. It is estimated that up to 75% of all the waste can be recycled or repurposed, a figure that how impactful the process can be if done right. Almost everything we see around us can be recycled, although different materials require different techniques when they are recycled. Most of the commonly recyclable materials include batteries, biodegradable waste, clothing, electronics, garments, glass, metals, paper, plastics, and a lot more.`,
        },
        {
          title: 'Why is ecology important?',
          text: `Ecology enriches our world and is crucial for human wellbeing and prosperity. It provides new knowledge of the interdependence between people and nature that is vital for food production, maintaining clean air and water, and sustaining biodiversity in a changing climate. Ecology provides the essential basis for nature conservation. Maintaining a mosaic of habitats ensures the survival of a rich variety of species. For instance, heathland is a valued landscape that is fast disappearing throughout much of Western Europe, but studies have helped identify how to preserve its ecological characteristic. Governments and citizens around the world are increasingly aware of the consequences of atmospheric pollution and climate change. In large-scale experiments, plants and animals are exposed to carefully controlled atmospheres and different ecological conditions. Scientists use this information to understand how they respond to pollution levels, and make predictions about future climate change.`,
        },
      ],
    })
  },
}

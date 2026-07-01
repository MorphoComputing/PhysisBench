# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/2ACY/sequence/2ACY.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/2ACY/seeds/seed_0/2ACY.pdb`
- residues: 96
- mode: oracle
- ca_rmsd: 0.067 A
- tm_score_ca_ordered: 0.9996440468535074
- heavy_atom_rmsd: 2.849 A
- sidechain_heavy_atom_rmsd: 3.791 A
- **all-atom quality (honest):** heavy 2.849 A, sidechain 3.791 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/83 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 4371
- bin_accuracy: 0.978

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.0673414236446372
- ga_delta_rmsd: 0.013451393863723585  ga_fitness_mode: energy
- pre_local_rmsd: 0.06786357031198152  localized_anchor_rmsd: 0.06731053329084484

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** V86 → 6 conflicts (60%)
- explained: 6/10 conflicts by 1 root cause(s)
- metrics: hubs=7 (frac 0.073), conflicts/hub=1.4, max_incompat=2.92Å, chain_span=0.708
- **fix-first:** [LOW_CONFLICT] Root cause(s): V86 — explain ~6/10 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P53** — severity 2.55, 2 conflict(s); suspect input ~`D3` (group: pull_in)
  - pull-in (wants closer): D42@27.5Å(now 30.3,conf 1.00), Q43@27.5Å(now 30.0,conf 1.00)
  - D42↔D3: targets 27.5/4.9Å but partners are 34.8Å apart → too_far_apart by 2.4Å
  - Q43↔D3: targets 27.5/4.9Å but partners are 34.4Å apart → too_far_apart by 2.0Å
- **S55** — severity 2.46, 2 conflict(s); suspect input ~`G2` (group: pull_in)
  - pull-in (wants closer): D42@27.5Å(now 31.0,conf 1.00), Q43@27.5Å(now 30.1,conf 1.00)
  - D42↔G2: targets 27.5/5.0Å but partners are 35.0Å apart → too_far_apart by 2.5Å
  - Q43↔G2: targets 27.5/5.0Å but partners are 34.2Å apart → too_far_apart by 1.7Å
- **L5** — severity 2.13, 2 conflict(s); suspect input ~`V86` (group: pull_in)
  - pull-in (wants closer): G18@27.5Å(now 31.8,conf 1.00), K71@27.5Å(now 31.1,conf 1.00), K15@27.5Å(now 30.4,conf 1.00), D42@27.5Å(now 30.3,conf 1.00), V19@27.5Å(now 30.3,conf 1.00), Q43@27.5Å(now 30.2,conf 1.00)
  - K71↔V86: targets 27.5/6.5Å but partners are 36.2Å apart → too_far_apart by 2.2Å
  - G18↔V86: targets 27.5/6.5Å but partners are 35.7Å apart → too_far_apart by 1.7Å
- **V19** — severity 1.61, 1 conflict(s); suspect input ~`K71` (group: pull_in)
  - pull-in (wants closer): V86@27.5Å(now 34.7,conf 1.00), T4@27.5Å(now 32.8,conf 1.00), K87@27.5Å(now 32.8,conf 1.00), I85@27.5Å(now 32.4,conf 1.00), D3@27.5Å(now 32.4,conf 1.00), V84@27.5Å(now 32.0,conf 1.00), G2@27.5Å(now 31.9,conf 1.00), E1@27.5Å(now 30.9,conf 1.00), L5@27.5Å(now 30.3,conf 1.00), K83@27.5Å(now 30.1,conf 1.00)
  - V86↔K71: targets 27.5/5.8Å but partners are 36.2Å apart → too_far_apart by 2.9Å
- **H73** — severity 1.39, 1 conflict(s); suspect input ~`K15` (group: pull_in)
  - pull-in (wants closer): V86@27.5Å(now 34.4,conf 1.00), K87@27.5Å(now 33.4,conf 1.00), I85@27.5Å(now 31.5,conf 1.00), T4@27.5Å(now 30.9,conf 1.00), D3@27.5Å(now 30.6,conf 1.00), L88@27.5Å(now 30.4,conf 1.00), D89@27.5Å(now 30.3,conf 1.00), V84@27.5Å(now 30.0,conf 1.00)
  - V86↔K15: targets 27.5/5.0Å but partners are 35.0Å apart → too_far_apart by 2.4Å
- **S72** — severity 1.10, 1 conflict(s); suspect input ~`K15` (group: pull_in)
  - pull-in (wants closer): V86@27.5Å(now 33.8,conf 1.00), K87@27.5Å(now 32.5,conf 1.00), I85@27.5Å(now 31.2,conf 1.00), T4@27.5Å(now 30.8,conf 1.00), D3@27.5Å(now 30.3,conf 1.00), V84@27.5Å(now 30.2,conf 1.00)
  - V86↔K15: targets 27.5/5.5Å but partners are 35.0Å apart → too_far_apart by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=31 · strand(E)=33 · 3-10(G)=18 · coil(C)=14

```
EEGEGECEEEEGGEHCEHGHHHHHHHHHHHHHHEEEECECEHHHECEEEGEECGHHHHHHHHHHGCEECGGEGCHEGGCEHCEGEGECGEGECEGC
```

## Backbone H-bond Network

- total=47 · helix(i→i+4)=17 · sheet=30
  - G18 ↔ R22  (helix)
  - F20 ↔ Y24  (helix)
  - F21 ↔ T25  (helix)
  - R22 ↔ Q26  (helix)
  - K23 ↔ A27  (helix)
  - Y24 ↔ E28  (helix)
  - T25 ↔ G29  (helix)
  - Q26 ↔ K30  (helix)
  - A27 ↔ K31  (helix)
  - E28 ↔ L32  (helix)
  - G29 ↔ G33  (helix)
  - S55 ↔ H59  (helix)
  - K56 ↔ M60  (helix)
  - V57 ↔ Q61  (helix)
  - R58 ↔ E62  (helix)
  - H59 ↔ W63  (helix)
  - M60 ↔ L64  (helix)
  - E1 ↔ I6  (sheet)
  - E11 ↔ Q17  (sheet)
  - L34 ↔ G48  (sheet)
  - … +27 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=45 · exposed=28 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=379 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=207 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5716 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 83 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

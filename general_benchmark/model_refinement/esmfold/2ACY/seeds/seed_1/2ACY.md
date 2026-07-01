# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2ACY\sequence\2ACY.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\2ACY\seeds\seed_1\2ACY.pdb`
- residues: 96
- mode: oracle
- ca_rmsd: 0.485 A
- tm_score_ca_ordered: 0.9839817787037597
- heavy_atom_rmsd: 3.064 A
- sidechain_heavy_atom_rmsd: 3.882 A
- **all-atom quality (honest):** heavy 3.064 A, sidechain 3.882 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/83 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 4371
- bin_accuracy: 0.920

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=45
- rigid_domain_reconvergence: applied=True accepted=1 rmsd=0.5042543847377683 -> 0.4914136697352458 A
- topology_reconvergence: applied=True accepted=3/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.4848197527473082
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.4874568614274531  localized_anchor_rmsd: 0.48479054193783727

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=2 (frac 0.021), conflicts/hub=1.0, max_incompat=1.81Å, chain_span=0.156
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V19** — severity 0.75, 1 conflict(s); suspect input ~`K71` (group: pull_in)
  - pull-in (wants closer): V86@27.5Å(now 33.9,conf 0.99), D3@27.5Å(now 33.3,conf 0.99), E1@27.5Å(now 33.2,conf 0.99), T4@27.5Å(now 32.3,conf 0.98), G2@27.4Å(now 31.9,conf 0.97), K87@27.4Å(now 32.1,conf 0.97), I85@27.4Å(now 31.8,conf 0.97), V84@27.4Å(now 31.6,conf 0.97), L5@27.3Å(now 29.9,conf 0.92), K83@27.3Å(now 29.9,conf 0.91)
  - V86↔K71: targets 27.5/5.9Å but partners are 35.2Å apart → too_far_apart by 1.8Å
- **T4** — severity 0.63, 1 conflict(s); suspect input ~`E1` (group: pull_in)
  - pull-in (wants closer): G18@27.5Å(now 33.7,conf 0.99), D42@27.5Å(now 32.4,conf 0.98), K71@27.5Å(now 32.3,conf 0.98), Q43@27.5Å(now 32.2,conf 0.98), V19@27.5Å(now 32.3,conf 0.98), K15@27.5Å(now 31.9,conf 0.97), G44@27.4Å(now 31.8,conf 0.97), Q17@27.4Å(now 31.3,conf 0.96), H73@27.4Å(now 30.7,conf 0.95), G14@27.4Å(now 30.4,conf 0.94), S72@27.4Å(now 30.4,conf 0.94), P70@27.4Å(now 30.3,conf 0.94), F20@27.3Å(now 30.3,conf 0.93)
  - G18↔E1: targets 27.5/5.9Å but partners are 34.9Å apart → too_far_apart by 1.5Å

## Secondary Structure (DSSP-like)

- helix(H)=33 · strand(E)=32 · 3-10(G)=20 · coil(C)=11

```
EEGEGGEEEEEGGEHCEHGHHHHHHHHHHHHHHEGEECECGHHHECEEECEECGHHHHHHHHHHGCEEEHGEGCHEGEGEHCEGGGECHEGEGEGC
```

## Backbone H-bond Network

- total=39 · helix(i→i+4)=17 · sheet=22
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
  - E11 ↔ Q17  (sheet)
  - L34 ↔ G48  (sheet)
  - L34 ↔ Q49  (sheet)
  - … +19 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=42 · exposed=29 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=386 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=210 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9306 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 83 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

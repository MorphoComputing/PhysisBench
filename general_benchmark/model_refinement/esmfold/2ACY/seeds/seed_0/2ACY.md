# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2ACY\sequence\2ACY.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\2ACY\seeds\seed_0\2ACY.pdb`
- residues: 96
- mode: oracle
- ca_rmsd: 0.475 A
- tm_score_ca_ordered: 0.9844436693772657
- heavy_atom_rmsd: 2.615 A
- sidechain_heavy_atom_rmsd: 3.399 A
- **all-atom quality (honest):** heavy 2.615 A, sidechain 3.399 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/83 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 4371
- bin_accuracy: 0.920

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=48
- rigid_domain_reconvergence: applied=True accepted=2 rmsd=0.5012511631775919 -> 0.47884253454434456 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.4749957528314102
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.4772571473567406  localized_anchor_rmsd: 0.4749476036207148

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.01), conflicts/hub=1.0, max_incompat=1.76Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V19** — severity 0.73, 1 conflict(s); suspect input ~`K71` (group: pull_in)
  - pull-in (wants closer): V86@27.5Å(now 33.8,conf 0.99), D3@27.5Å(now 33.2,conf 0.99), E1@27.5Å(now 33.1,conf 0.99), T4@27.5Å(now 32.3,conf 0.98), G2@27.4Å(now 31.9,conf 0.97), K87@27.4Å(now 32.0,conf 0.97), I85@27.4Å(now 31.8,conf 0.97), V84@27.4Å(now 31.6,conf 0.97), L5@27.3Å(now 29.9,conf 0.92), K83@27.3Å(now 29.8,conf 0.91)
  - V86↔K71: targets 27.5/5.9Å but partners are 35.2Å apart → too_far_apart by 1.8Å

## Secondary Structure (DSSP-like)

- helix(H)=33 · strand(E)=32 · 3-10(G)=18 · coil(C)=13

```
EGHEGGEEEEEGGEHCEHGHHHHHHHHHHHHHHEGEECECEHHGECEEECEECGHHHHHHHHHHGCCEEHGEGCHEGEGEHCEGEGECHEGECEGC
```

## Backbone H-bond Network

- total=40 · helix(i→i+4)=17 · sheet=23
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
  - … +20 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=42 · exposed=29 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=388 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=211 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9306 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 83 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

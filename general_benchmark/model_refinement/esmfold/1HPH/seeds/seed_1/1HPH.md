# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HPH\sequence\1HPH.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\1HPH\seeds\seed_1\1HPH.pdb`
- residues: 35
- mode: oracle
- ca_rmsd: 5.223 A
- tm_score_ca_ordered: 0.18741689364413788
- heavy_atom_rmsd: 6.867 A
- sidechain_heavy_atom_rmsd: 7.853 A
- **all-atom quality (honest):** heavy 6.867 A, sidechain 7.853 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 518
- bin_accuracy: 0.685

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=domain reason=accepted tested=30
- rigid_domain_reconvergence: applied=True accepted=17 rmsd=5.922652017032215 -> 3.10388660190178 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.22320548116876
- ga_delta_rmsd: -3.1229137056350114  ga_fitness_mode: energy
- pre_local_rmsd: 5.2232379474567345  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** H13 → 5 conflicts (100%)
- explained: 5/5 conflicts by 1 root cause(s)
- metrics: hubs=4 (frac 0.114), conflicts/hub=1.2, max_incompat=1.88Å, chain_span=0.229
- **fix-first:** [LOW_CONFLICT] Root cause(s): H13 — explain ~5/5 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R24** — severity 1.11, 2 conflict(s); suspect input ~`H13` (group: pull_in)
  - pull-in (wants closer): H13@16.3Å(now 19.1,conf 0.35)
  - Q28↔H13: targets 6.4/16.3Å but partners are 24.3Å apart → too_far_apart by 1.6Å
  - L27↔H13: targets 5.7/16.3Å but partners are 23.5Å apart → too_far_apart by 1.6Å
- **M17** — severity 0.64, 1 conflict(s); suspect input ~`L27` (group: pull_in)
  - pull-in (wants closer): L27@15.2Å(now 17.8,conf 0.34)
  - H13↔L27: targets 6.4/15.2Å but partners are 23.5Å apart → too_far_apart by 1.9Å
- **S16** — severity 0.53, 1 conflict(s); suspect input ~`L27` (group: pull_in)
  - pull-in (wants closer): L27@16.4Å(now 19.2,conf 0.35)
  - H13↔L27: targets 5.6/16.4Å but partners are 23.5Å apart → too_far_apart by 1.5Å
- **E21** — severity 0.51, 1 conflict(s); suspect input ~`H13` (group: pull_in)
  - pull-in (wants closer): H13@12.2Å(now 14.8,conf 0.34)
  - Q28↔H13: targets 10.6/12.2Å but partners are 24.3Å apart → too_far_apart by 1.5Å

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=13 · 3-10(G)=3 · coil(C)=2

```
CHHHHHHEHHEEHEHEHEHEEEGHHEGGCHHEHEE
```

## Backbone H-bond Network

- total=18 · helix(i→i+4)=7 · sheet=11
  - S2 ↔ L6  (helix)
  - E3 ↔ M7  (helix)
  - Q5 ↔ N9  (helix)
  - L6 ↔ L10  (helix)
  - N9 ↔ H13  (helix)
  - H13 ↔ M17  (helix)
  - N15 ↔ R19  (helix)
  - H8 ↔ L14  (sheet)
  - G11 ↔ S16  (sheet)
  - G11 ↔ E18  (sheet)
  - K12 ↔ E18  (sheet)
  - L14 ↔ V20  (sheet)
  - L14 ↔ E21  (sheet)
  - S16 ↔ E21  (sheet)
  - S16 ↔ W22  (sheet)
  - V20 ↔ K26  (sheet)
  - E21 ↔ K26  (sheet)
  - K26 ↔ N32  (sheet)

## Solvent Accessibility (burial)

- buried=18 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=95 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7958 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

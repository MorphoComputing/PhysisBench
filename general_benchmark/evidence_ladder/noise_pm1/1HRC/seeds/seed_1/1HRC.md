# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HRC\sequence\1HRC.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1HRC\seeds\seed_1\1HRC.pdb`
- residues: 102
- mode: oracle
- ca_rmsd: 0.580 A
- tm_score_ca_ordered: 0.9764792584081666
- heavy_atom_rmsd: 2.790 A
- sidechain_heavy_atom_rmsd: 3.670 A
- **all-atom quality (honest):** heavy 2.790 A, sidechain 3.670 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/85 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 3256
- bin_accuracy: 0.650

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=54
- rigid_domain_reconvergence: applied=True accepted=4 rmsd=0.7180371799889462 -> 0.6527731549644307 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.5800900431433389
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.5910974401337745  localized_anchor_rmsd: 0.5801023841615732

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L67 → 25 conflicts (22%); F35 → 13 conflicts (11%); G28 → 12 conflicts (10%)
- explained: 50/116 conflicts by 3 root cause(s)
- metrics: hubs=43 (frac 0.422), conflicts/hub=2.7, max_incompat=4.56Å, chain_span=0.951
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L67 + F35 + G28 — explain ~50/116 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L67** — severity 16.24, 20 conflict(s); suspect input ~`N51` (group: pull_in)
  - pull-in (wants closer): I8@9.7Å(now 12.2,conf 0.34), N51@10.4Å(now 13.5,conf 0.34)
  - N51↔E89: targets 10.4/8.5Å but partners are 22.9Å apart → too_far_apart by 4.1Å
  - K87↔N51: targets 9.1/10.4Å but partners are 23.2Å apart → too_far_apart by 3.8Å
  - K52↔N51: targets 17.7/10.4Å but partners are 3.5Å apart → too_close_together by 3.8Å
- **G28** — severity 7.68, 8 conflict(s); suspect input ~`G23` (group: pull_in)
  - pull-in (wants closer): K78@6.8Å(now 9.6,conf 0.38)
  - K78↔G23: targets 6.8/10.0Å but partners are 20.8Å apart → too_far_apart by 4.0Å
  - K78↔K24: targets 6.8/8.5Å but partners are 18.6Å apart → too_far_apart by 3.3Å
  - K78↔T18: targets 6.8/7.7Å but partners are 17.6Å apart → too_far_apart by 3.0Å
- **M64** — severity 4.97, 6 conflict(s); suspect input ~`F35` (group: pull_in)
  - pull-in (wants closer): F35@9.4Å(now 13.1,conf 0.34)
  - F35↔K87: targets 9.4/7.2Å but partners are 19.9Å apart → too_far_apart by 3.2Å
  - G33↔F35: targets 17.8/9.4Å but partners are 5.4Å apart → too_close_together by 3.0Å
  - E68↔F35: targets 6.1/9.4Å but partners are 17.8Å apart → too_far_apart by 2.3Å
- **T18** — severity 4.38, 6 conflict(s); suspect input ~`K6` (group: push_out)
  - pull-in (wants closer): Y73@18.5Å(now 22.6,conf 0.37), G83@15.9Å(now 18.6,conf 0.34)
  - push-out (wants farther): K7@16.9Å(now 13.6,conf 0.35)
  - K6↔K7: targets 10.7/16.9Å but partners are 3.5Å apart → too_close_together by 2.7Å
  - Y73↔G23: targets 18.5/5.6Å but partners are 26.3Å apart → too_far_apart by 2.2Å
  - K7↔F9: targets 16.9/9.7Å but partners are 4.9Å apart → too_close_together by 2.2Å
- **R37** — severity 4.24, 4 conflict(s); suspect input ~`Y96` (group: push_out)
  - push-out (wants farther): Y96@19.7Å(now 16.2,conf 0.40)
  - L34↔Y96: targets 5.5/19.7Å but partners are 11.0Å apart → too_close_together by 3.2Å
  - Y96↔K98: targets 19.7/10.7Å but partners are 5.4Å apart → too_close_together by 3.7Å
  - Y96↔L97: targets 19.7/13.8Å but partners are 3.2Å apart → too_close_together by 2.7Å
- **P43** — severity 4.04, 4 conflict(s); suspect input ~`K52` (group: pull_in)
  - pull-in (wants closer): K86@27.4Å(now 30.8,conf 0.97), T88@27.1Å(now 29.9,conf 0.86), K52@8.9Å(now 11.6,conf 0.34)
  - A50↔K52: targets 18.4/8.9Å but partners are 5.0Å apart → too_close_together by 4.6Å
  - N53↔K52: targets 15.2/8.9Å but partners are 3.6Å apart → too_close_together by 2.7Å
  - K54↔K52: targets 17.1/8.9Å but partners are 5.9Å apart → too_close_together by 2.3Å

## Secondary Structure (DSSP-like)

- helix(H)=42 · strand(E)=30 · 3-10(G)=22 · coil(C)=8

```
EGEGHHHHHHEEHHHCEGCECHECGEHEEGHEHHEHEEEHCHGGEGEEGHHGGEGECGEHEHHHHGHHEHHHGHGHEHEGEGECCEGHGHEHHHHHHHGGHE
```

## Backbone H-bond Network

- total=62 · helix(i→i+4)=17 · sheet=45
  - G5 ↔ F9  (helix)
  - K6 ↔ V10  (helix)
  - F9 ↔ C13  (helix)
  - V10 ↔ A14  (helix)
  - T27 ↔ L31  (helix)
  - G36 ↔ G40  (helix)
  - E60 ↔ M64  (helix)
  - L63 ↔ L67  (helix)
  - M64 ↔ E68  (helix)
  - E68 ↔ K72  (helix)
  - K72 ↔ G76  (helix)
  - T88 ↔ D92  (helix)
  - R90 ↔ I94  (helix)
  - D92 ↔ Y96  (helix)
  - L93 ↔ L97  (helix)
  - I94 ↔ K98  (helix)
  - L97 ↔ T101  (helix)
  - E3 ↔ Q11  (sheet)
  - Q11 ↔ H17  (sheet)
  - K12 ↔ H17  (sheet)
  - … +42 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=27 · exposed=46 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=381 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=161 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0935 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 85 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
